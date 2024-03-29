

if(! require('keras') )install.packages('keras')
if(! require('tidyverse') )install.packages('tidyverse')
library(tidyverse)
library(keras)

# read the data
# train <- read_csv("/content/sample_data/mnist_train_small.csv", col_names = F) 
# or from package 
mnist <- dataset_mnist()
train_images <- mnist %>% .[['train']] %>% .[['x']] %>%
  array_reshape(c(60000, 28, 28, 1)) # reindex multi-dimensional array
test_images <- mnist %>% .[['test']] %>% .[['x']] %>%
  array_reshape(c(10000, 28, 28, 1))
train_labels <- mnist %>% .[['train']] %>% .[['y']]
test_labels <- mnist %>% .[['test']] %>% .[['y']]
# class(train_images)
train_images %>% .[1,,,1]

par(mfcol=c(6,6))
par(mar=c(0, 0, 1, 0), xaxs='i', yaxs='i')
for (idx in 1:36) {
  train_images %>% .[idx,,,1] %>% as.raster(max = 255) %>% plot()
  title(main = train_labels[idx])
}

# transform the data with scaling
train_images <- train_images / 255
test_images <- test_images / 255
# and another reshape - classes
train_labels <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)

# describe the model
# convolutional neural networks (convnets)
model <- keras_model_sequential() %>% # Keras Model composed of a linear stack of layers
  layer_conv_2d(filters = 32, kernel_size = c(3, 3), activation = "relu",
                input_shape = c(28, 28, 1)) %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2, 2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = "relu")
model

# layer_conv_2d() -  one of 20 convolutional layers of 100 different type layers,
#       convolution of f, g is f*g and expresses how the shape of f is modified by g
## filters - dim of the output space
## kernel_size - w * h of the 2D convolution window
## activation - activation function 
### linear function: 'a(x) = x’
### relu, rectified linear unit function: 'a(x) = max(x, 0)'
### sigmoid function, 'a(x) = 1 / (1 + exp(-x))'
### softmax function: 'a(x) = e^x_i / Σ e^x_i'
## input shape - image_height, image_width, image_channels
# layer_max_pooling_2d - down scale matrix (tensor) by pool_size

# add classification layers
model <- model %>%
  layer_flatten() %>%
  layer_dense(units = 64, activation = "relu") %>%
  layer_dense(units = 10, activation = "softmax")
model
# layer_flatten() - transforms from a 2d-array to a 1d-array
# layer_dense() - fully connected neural layer with 64 (10) neurons (nodes)
## last layer with 'softmax' activation returns an array of 10 probability scores that sum to 1

# compile the model
model %>% compile(
  optimizer = "rmsprop",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)
# compile - add more settings
## optimizer - method how the model is updated after one run
## loss - measure how accurate is model during training
## metrics - method how we monitor training and testing steps

# fit the model on training data
model %>% fit(
  train_images, train_labels,
  epochs = 5, batch_size=64
)
# train the model
## specify in- and dependent variables
## epochs - number of runs
## batch_size - number of samples used in one run

# evaluate the model on test data
model %>% evaluate(test_images, test_labels)

save_model_tf(model, "examples/mnist/mnist_model")


# get prediction from model
predictions <- model %>% predict(train_images)
predictions[10, ]

# class labels from 0 to 9, so it is "5" predicted 
which.max(predictions[10, ]) - 1

train_images %>% .[10,,,1] %>% as.raster(max = 1) %>% plot()

# Extra 
# Myself created samples for prediction

install.packages('raster')

library(raster)
scale_me <- function(x){x/255}
destfile = "tmp.PNG"

"https://github.com/JacekPardyak/tb-data-science-talks/raw/master/2022-11-24/sample.png" %>%
  download.file(destfile)

y = destfile %>% raster() %>% as.matrix() %>% scale_me() %>%
   array(dim = c(1, 28, 28, 1))

model %>% predict(y) %>% t() %>% as_tibble() %>% rename(probability = V1) %>% 
  mutate(class = row_number() - 1) %>% mutate(class = as.factor(class)) %>%
  ggplot() +
  aes(x = class, y = probability) +
  geom_bar(stat="identity")

y[1,,,1] %>% as.raster() %>% plot()

# predictions for noise
y = runif(28 * 28) %>% matrix(nrow = 28) %>% array(dim = c(1, 28, 28, 1))

model %>% predict(y) %>% t() %>% as_tibble() %>% rename(probability = V1) %>% 
  mutate(class = row_number() - 1) %>% mutate(class = as.factor(class)) %>%
  ggplot() +
  aes(x = class, y = probability) +
  geom_bar(stat="identity")

y[1,,,1] %>% as.raster() %>% plot()

# References:
# - https://www.manning.com/books/deep-learning-with-r

# - https://towardsdatascience.com/introduction-to-deep-learning-with-keras-in-r-81bafd903a7a#c794

# - https://tensorflow.rstudio.com/
