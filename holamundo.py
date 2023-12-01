import tensorflow as tf

# Hello TensorFlow!
hello = tf.constant('Hello, TensorFlow!')
tf.print(hello)

# Check available devices to TensorFlow
print("Num GPUs Available: ", len(tf.config.experimental.list_physical_devices('GPU')))

# Additional details about devices
print(tf.config.experimental.list_physical_devices())

print(tf.__version__)
