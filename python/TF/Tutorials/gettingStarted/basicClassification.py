# !/usr/local/bin/python3
from __future__ import absolute_import, division, print_function


import tensorflow as tf
from tensorflow import keras

import numpy as np
import matplotlib.pyplot as plt

# ----------------------------
# 1. Import & Explore the Data
# ----------------------------
fashion_mnist = keras.datasets.fashion_mnist

(train_images, train_labels), (test_images, test_labels) = fashion_mnist.load_data()

# Use this to explore the data to begin with
	# plt.figure()
	# plt.imshow(train_images[0])
	# plt.colorbar()
	# plt.grid(False)
	# plt.show()

# ----------------------
# 2. Preprocess the Data
# ----------------------

# Store the class names so we can use them for plotting
class_names = ['T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat', 'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot']

# Scale the pixelation values to preprocess the data
train_images = train_images / 255.0
test_images = test_images / 255.0

# Print the first 25 images with their class name to verify pre-processing format
	# plt.figure(figsize=(10, 10))
	# for i in range(25):
	# 	plt.subplot(5, 5, i+1)
	# 	plt.xticks([])
	# 	plt.yticks([])
	# 	plt.grid(False)
	# 	plt.imshow(train_images[i], cmap=plt.cm.binary)
	# 	plt.xlabel(class_names[train_labels[i]])
	# plt.show()

# ------------------
# 3. Build the model
# ------------------

# Setup the layers
model = keras.Sequential([
	keras.layers.Flatten(input_shape=(28, 28)),
	keras.layers.Dense(128, activation=tf.nn.relu),
	keras.layers.Dense(10, activation=tf.nn.softmax)
	])

# Setup the loss, optimization and metrics
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# ------------------
# 4. Train the model
# ------------------

model.fit(train_images, train_labels, epochs=5)

# --------------------
# 5. Evaluate Accuracy
# --------------------

test_loss, test_acc = model.evaluate(test_images, test_labels)

print("Test accuracy:", test_acc)

# -------------------
# 6. Make Predictions
# -------------------

# Apply predictions to all test_images
predictions = model.predict(test_images)

# Investigate predictions on the first image
	# print(predictions[0])
	# print("Highest category:", np.argmax(predictions[0]))
	# print("Test Label:", test_labels[0])
	# print("Match?", (test_labels[0] == np.argmax(predictions[0])))

# Graph this to look at the full 10-channel set:

# Image plotting function
def plot_image(i, predictions_array, true_label, img):
	predictions_array, true_label, img = predictions_array[i], true_label[i], img[i]
	plt.grid(False)
	plt.xticks([])
	plt.yticks([])

	plt.imshow(img, cmap=plt.cm.binary)

	predicted_label = np.argmax(predictions_array)

	color = 'blue' if predicted_label == true_label else 'red'

	plt.xlabel("{} {:2.0f}% ({})".format(
		class_names[predicted_label], 
		100*np.max(predictions_array), 
		class_names[true_label], color=color)
	)

# Final layer plotting function
def plot_value_array(i, predictions_array, true_label):
	predictions_array, true_label = predictions_array[i], true_label[i]
	plt.grid(False)
	plt.xticks([])
	plt.yticks([])

	thisplot = plt.bar(range(10), predictions_array, color="#777777")
	plt.ylim([0, 1])
	predicted_label = np.argmax(predictions_array)

	thisplot[predicted_label].set_color('red')
	thisplot[true_label].set_color('blue')

# Let's look at an individual image, predictions and predictions array
	# i = 12
	# plt.figure(figsize=(6,3))
	# plt.subplot(1, 2, 1)
	# plot_image(i, predictions, test_labels, test_images)
	# plt.subplot(1, 2, 2)
	# plot_value_array(i, predictions, test_labels)
	# plt.show()

# Let's look at a bunch of images, predictions and their true labels
	# num_rows = 5
	# num_cols = 3
	# num_images = num_rows*num_cols
	# plt.figure(figsize=(2*2*num_cols, 2*num_rows))
	# for i in range(num_images):
	# 	plt.subplot(num_rows, 2*num_cols, 2*i+1)
	# 	plot_image(i, predictions, test_labels, test_images)
	# 	plt.subplot(num_rows, 2*num_cols, 2*i+2)
	# 	plot_value_array(i, predictions, test_labels)
	# plt.show()

# Let's predict on a single image:
img = test_images[0]
img = (np.expand_dims(img, 0))
predictions_single = model.predict(img)
plot_value_array(0, predictions_single, test_labels)
_ = plt.xticks(range(10), class_names, rotation=45)
plt.show()