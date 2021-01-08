---
layout: post
title: "ML Comparison"
date: 2021-01-08
tags: ML AI Keras TensorFlow
image: https://images.unsplash.com/photo-1569803903286-eb86d49af323
thumb: https://images.unsplash.com/photo-1569803903286-eb86d49af323?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fGNvbXBhcmlzb258ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@jdent
type: article
---

This is a constantly evolving field, so I'll keep updating this comparison and add other frameworks as time permits.


| API Element Type                            | Keras                                                                                                              | TensorFlow (Python)  *Excl. tf.keras*                                                                             |     |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- | --- |
| Model                                       | [Model](https://keras.io/api/models/model/)                                                                        |                                                                                                   |     |
| Sequential Model                            | [Sequential](https://keras.io/api/models/sequential/#sequential-class)                                             |                                                                                                   |     |
| *Core Layer Types*                          |
| Base Layer                                  | [Base Layer](https://keras.io/api/layers/base_layer/)                                                              |                                                                                                   |     |
| Activation Layer                            | [Activation](https://keras.io/api/layers/core_layers/activation)                                                   |                                                                                                   |     |
| Dense Layer                                 | [Dense](https://keras.io/api/layers/core_layers/dense)                                                             |                                                                                                   |     |
| Embedding Layer                             | [Embedding](https://keras.io/api/layers/core_layers/embedding)                                                     |                                                                                                   |     |
| Masking Layer                               | [Masking](https://keras.io/api/layers/core_layers/masking)                                                         |                                                                                                   |     |
| Lambda Layer                                | [Lambda](https://keras.io/api/layers/core_layers/lambda)                                                           |                                                                                                   |     |
| *Convolution Layer Types*                   |
| Conv1D Layer                                | [Conv1D](https://keras.io/api/layers/convolution_layers/convolution1d)                                             | [tf.nn.conv1d](https://www.tensorflow.org/api_docs/python/tf/nn/conv1d)                           |     |
| Conv2D Layer                                | [Conv2D](https://keras.io/api/layers/convolution_layers/convolution2d)                                             | [tf.nn.conv2d](https://www.tensorflow.org/api_docs/python/tf/nn/conv2d)                           |     |
| Conv3D Layer                                | [Conv3D](https://keras.io/api/layers/convolution_layers/convolution3d)                                             | [tf.nn.conv3d](https://www.tensorflow.org/api_docs/python/tf/nn/conv3d)                           |     |
| SeparableConv1D Layer                       | [SeparableConv1D](https://keras.io/api/layers/convolution_layers/separable_convolution1d)                          | []()                                                                                              |     |
| SeparableConv2D Layer                       | [SeparableConv2D](https://keras.io/api/layers/convolution_layers/separable_convolution2d)                          | [tf.nn.separable_conv2d](https://www.tensorflow.org/api_docs/python/tf/nn/separable_conv2d)       |     |
| DepthwiseConv2D Layer                       | [DepthwiseConv2D](https://keras.io/api/layers/convolution_layers/depthwise_convolution2d)                          | []()                                                                                              |     |
| Conv2DTranspose Layer                       | [Conv2DTranspose](https://keras.io/api/layers/convolution_layers/convolution2d_transpose)                          | [tf.nn.conv2d_transpose](https://www.tensorflow.org/api_docs/python/tf/nn/conv2d_transpose)       |     |
| Conv2DTranspose Layer                       | [Conv3DTranspose](https://keras.io/api/layers/convolution_layers/convolution3d_transpose)                          | [tf.nn.conv3d_transpose](https://www.tensorflow.org/api_docs/python/tf/nn/conv3d_transpose)       |     |
| *Pooling Layer Types*                       |
| MaxPooling1D layer                          | [MaxPooling1D](https://keras.io/api/layers/pooling_layers/max_pooling1d)                                           | [tf.nn.max_pool1d](https://www.tensorflow.org/api_docs/python/tf/nn/max_pool1d)                   |     |
| MaxPooling2D layer                          | [MaxPooling2D](https://keras.io/api/layers/pooling_layers/max_pooling2d)                                           | [tf.nn.max_pool2d](https://www.tensorflow.org/api_docs/python/tf/nn/max_pool2d)                   |     |
| MaxPooling3D layer                          | [MaxPooling3D](https://keras.io/api/layers/pooling_layers/max_pooling3d)                                           | [tf.nn.max_pool3d](https://www.tensorflow.org/api_docs/python/tf/nn/max_pool3d)                   |
| AveragePooling1D layer                      | [AveragePooling1D](https://keras.io/api/layers/pooling_layers/average_pooling1d)                                   | [tf.nn.avg_pool1d](https://www.tensorflow.org/api_docs/python/tf/nn/avg_pool1d)                   |     |
| AveragePooling2D layer                      | [AveragePooling2D](https://keras.io/api/layers/pooling_layers/average_pooling2d)                                   | [tf.nn.avg_pool2d](https://www.tensorflow.org/api_docs/python/tf/nn/avg_pool2d)                   |     |
| AveragePooling3D layer                      | [AveragePooling3D](https://keras.io/api/layers/pooling_layers/average_pooling3d)                                   | []()                                                                                              |     |
| GlobalMaxPooling1D layer                    | [GlobalMaxPooling1D](https://keras.io/api/layers/pooling_layers/global_max_pooling1d)                              | []()                                                                                              |     |
| GlobalMaxPooling2D layer                    | [GlobalMaxPooling2D](https://keras.io/api/layers/pooling_layers/global_max_pooling2d)                              | []()                                                                                              |
| GlobalMaxPooling3D layer                    | [GlobalMaxPooling3D](https://keras.io/api/layers/pooling_layers/global_max_pooling3d)                              | []()                                                                                              |
| GlobalAveragePooling1D layer                | [GlobalAveragePooling1D](https://keras.io/api/layers/pooling_layers/global_average_pooling1d)                      | []()                                                                                              |
| GlobalAveragePooling2D layer                | [GlobalAveragePooling2D](https://keras.io/api/layers/pooling_layers/global_average_pooling2d)                      | []()                                                                                              |
| GlobalAveragePooling3D layer                | [GlobalAveragePooling3D](https://keras.io/api/layers/pooling_layers/global_average_pooling3d)                      | []()                                                                                              |
| *Recurrent layers*                          |
| LSTM layer                                  | [LSTM](https://keras.io/api/layers/recurrent_layers/lstm)                                                          |
| GRU layer                                   | [GRU](https://keras.io/api/layers/recurrent_layers/gru)                                                            |
| SimpleRNN layer                             | [SimpleRNN](https://keras.io/api/layers/recurrent_layers/simple_rnn)                                               |
| TimeDistributed layer                       | [TimeDistributed](https://keras.io/api/layers/recurrent_layers/time_distributed)                                   |
| Bidirectional layer                         | [Bidirectional](https://keras.io/api/layers/recurrent_layers/bidirectional)                                        |
| ConvLSTM2D layer                            | [ConvLSTM2D](https://keras.io/api/layers/recurrent_layers/conv_lstm2d)                                             |
| Base RNN layer                              | [Base RNN](https://keras.io/api/layers/recurrent_layers/rnn)                                                       |
| *Core preprocessing layers*                 |
| TextVectorization layer                     | [TextVectorization](https://keras.io/api/layers/preprocessing_layers/core_preprocessing_layers/text_vectorization) |
| Normalization layer                         | [Normalization](https://keras.io/api/layers/preprocessing_layers/core_preprocessing_layers/normalization)          |
| *Categorical data preprocessing layers*     |
| CategoryEncoding layer                      | [CategoryEncoding](https://keras.io/api/layers/preprocessing_layers/categorical/category_encoding)                 |
| Hashing layer                               | [Hashing](https://keras.io/api/layers/preprocessing_layers/categorical/hashing)                                    |
| Discretization layer                        | [Discretization](https://keras.io/api/layers/preprocessing_layers/categorical/discretization)                      |
| StringLookup layer                          | [StringLookup](https://keras.io/api/layers/preprocessing_layers/categorical/string_lookup)                         |
| IntegerLookup layer                         | [IntegerLookup](https://keras.io/api/layers/preprocessing_layers/categorical/integer_lookup)                       |
| CategoryCrossing layer                      | [CategoryCrossing](https://keras.io/api/layers/preprocessing_layers/categorical/category_crossing)                 |
| *Image preprocessing & augmentation layers* |
| Resizing layer                              | [Resizing](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/resizing)                          |
| Rescaling layer                             | [Rescaling](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/rescaling)                        |
| CenterCrop layer                            | [CenterCrop](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/center_crop)                     |
| RandomCrop layer                            | [RandomCrop](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/random_crop)                     |
| RandomFlip layer                            | [RandomFlip](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/random_flip)                     |
| RandomTranslation layer                     | [RandomTranslation](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/random_translation)       |
| RandomRotation layer                        | [RandomRotation](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/random_rotation)             |
| RandomZoom layer                            | [RandomZoom](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/random_zoom)                     |
| RandomHeight layer                          | [RandomHeight](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/random_height)                 |
| RandomWidth layer                           | [RandomWidth](https://keras.io/api/layers/preprocessing_layers/image_preprocessing/random_width)                   |
| *Normalization Layers*                      |
| BatchNormalization layer                    | [BatchNormalization](https://keras.io/api/layers/normalization_layers/batch_normalization)                         | [tf.nn.batch_normalization](https://www.tensorflow.org/api_docs/python/tf/nn/batch_normalization) |
| LayerNormalization layer                    | [LayerNormalization](https://keras.io/api/layers/normalization_layers/layer_normalization)                         |
| *Regularization layers*                     |
| Dropout layer                               | [Dropout](https://keras.io/api/layers/regularization_layers/dropout)                                               | [tf.nn.dropout](https://www.tensorflow.org/api_docs/python/tf/nn/dropout)                         |
| SpatialDropout1D layer                      | [SpatialDropout1D](https://keras.io/api/layers/regularization_layers/spatial_dropout1d)                            |
| SpatialDropout2D layer                      | [SpatialDropout2D](https://keras.io/api/layers/regularization_layers/spatial_dropout2d)                            |
| SpatialDropout3D layer                      | [SpatialDropout3D](https://keras.io/api/layers/regularization_layers/spatial_dropout3d)                            |
| GaussianDropout layer                       | [GaussianDropout](https://keras.io/api/layers/regularization_layers/gaussian_dropout)                              |
| GaussianNoise layer                         | [GaussianNoise](https://keras.io/api/layers/regularization_layers/gaussian_noise)                                  |
| ActivityRegularization layer                | [ActivityRegularization](https://keras.io/api/layers/regularization_layers/activity_regularization)                |
| AlphaDropout layer                          | [AlphaDropout](https://keras.io/api/layers/regularization_layers/alpha_dropout)                                    |
| *Attention layers*                          |
| MultiHeadAttention layer                    | [MultiHeadAttention](https://keras.io/api/layers/attention_layers/multi_head_attention)                            |
| Attention layer                             | [Attention](https://keras.io/api/layers/attention_layers/attention)                                                |
| AdditiveAttention layer                     | [AdditiveAttention](https://keras.io/api/layers/attention_layers/additive_attention)                               |
| *Reshaping layers*                          |
| Reshape layer                               | [Reshape](https://keras.io/api/layers/reshaping_layers/reshape)                                                    |
| Flatten layer                               | [Flatten](https://keras.io/api/layers/reshaping_layers/flatten)                                                    | [tf.reshape(w,[-1])](https://www.tensorflow.org/api_docs/python/tf/reshape)                       |
| RepeatVector layer                          | [RepeatVector](https://keras.io/api/layers/reshaping_layers/repeat_vector)                                         |
| Permute layer                               | [Permute](https://keras.io/api/layers/reshaping_layers/permute)                                                    | [tf.transpose](https://www.tensorflow.org/api_docs/python/tf/transpose)                           |
| Cropping1D layer                            | [Cropping1D](https://keras.io/api/layers/reshaping_layers/cropping1d)                                              |
| Cropping2D layer                            | [Cropping2D](https://keras.io/api/layers/reshaping_layers/cropping2d)                                              |
| Cropping3D layer                            | [Cropping3D](https://keras.io/api/layers/reshaping_layers/cropping3d)                                              |
| UpSampling1D layer                          | [UpSampling1D](https://keras.io/api/layers/reshaping_layers/up_sampling1d)                                         |
| UpSampling2D layer                          | [UpSampling2D](https://keras.io/api/layers/reshaping_layers/up_sampling2d)                                         |
| UpSampling3D layer                          | [UpSampling3D](https://keras.io/api/layers/reshaping_layers/up_sampling3d)                                         |
| ZeroPadding1D layer                         | [ZeroPadding1D](https://keras.io/api/layers/reshaping_layers/zero_padding1d)                                       |
| ZeroPadding2D layer                         | [ZeroPadding2D](https://keras.io/api/layers/reshaping_layers/zero_padding2d)                                       |
| ZeroPadding3D layer                         | [ZeroPadding3D](https://keras.io/api/layers/reshaping_layers/zero_padding3d)                                       |
| *Merging layers*                            |
| Concatenate layer                           | [Concatenate](https://keras.io/api/layers/merging_layers/concatenate)                                              |
| Average layer                               | [Average](https://keras.io/api/layers/merging_layers/average)                                                      |
| Maximum layer                               | [Maximum](https://keras.io/api/layers/merging_layers/maximum)                                                      |
| Minimum layer                               | [Minimum](https://keras.io/api/layers/merging_layers/minimum)                                                      |
| Add layer                                   | [Add](https://keras.io/api/layers/merging_layers/add)                                                              |
| Subtract layer                              | [Subtract](https://keras.io/api/layers/merging_layers/subtract)                                                    |
| Multiply layer                              | [Multiply](https://keras.io/api/layers/merging_layers/multiply)                                                    |
| Dot layer                                   | [Dot](https://keras.io/api/layers/merging_layers/dot)                                                              |
| *Locally-connected layers*                  |
| LocallyConnected1D layer                    | [LocallyConnected1D](https://keras.io/api/layers/locally_connected_layers/locall_connected1d)                      |
| LocallyConnected2D layer                    | [LocallyConnected2D](https://keras.io/api/layers/locally_connected_layers/locall_connected2d)                      |
| *Activation layers*                         |
| ReLU layer                                  | [ReLU](https://keras.io/api/layers/activation_layers/relu)                                                         | [tf.nn.relu](https://www.tensorflow.org/api_docs/python/tf/nn/relu)                               |
| Softmax layer                               | [Softmax](https://keras.io/api/layers/activation_layers/softmax)                                                   | [tf.nn.softmax](https://www.tensorflow.org/api_docs/python/tf/nn/softmax)                         |
| LeakyReLU layer                             | [LeakyReLU](https://keras.io/api/layers/activation_layers/leaky_relu)                                              | [tf.nn.leaky_relu](https://www.tensorflow.org/api_docs/python/tf/nn/leaky_relu)                   |
| PReLU layer                                 | [PReLU](https://keras.io/api/layers/activation_layers/prelu)                                                       |
| ELU layer                                   | [ELU](https://keras.io/api/layers/activation_layers/elu)                                                           | [tf.nn.elu](https://www.tensorflow.org/api_docs/python/tf/nn/elu)                                 |
| ThresholdedReLU layer                       | [ThresholdedReLU](https://keras.io/api/layers/activation_layers/threshold_relu)                                    |