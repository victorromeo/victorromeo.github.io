---
layout: post
title: "KERAS Activation Functions"
date: 2019-08-16
tags: keras tensorflow machinelearning ai
---

### ReLu 
**Rectified Linear Unit**

This popular activation function is used

- typically found used in
    - convolutional neural networks
    - multi-layer networks
- pass positive sum evaluations (unaltered)
    - small positive values only contribute a small amount to the next layer
- removes negative sum evaluations from contributing to the next layer
    - small or large negative values are treated equally
- effectively diminishes the impact of ancestors of the activating neuron on the next layer

![ReLu](/images/articles/Keras/RELU.png){:. center-image}

