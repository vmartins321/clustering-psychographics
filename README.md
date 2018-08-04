# Audience Targeting in a New Market

## Overview

To better understand audience preferences, we develop measures of an audience member based on: 
* Interests - Politics, Sports, Social Issues
* Psychographics - trust the mainstream news, enjoy opinionated news, enjoy human-side of a story, discuss politics with friends, believe the news is too negative
* Brand Consumption - Al Jazeera, Vox, Vice, Buzzfeed, Fox, CNN, Huffpost

We cluster on these measures to produce audience segments and analyze the segments to identify key differentiators of audience segments, a winning content strategy for each one.

## Methods

Hierarchical clustering
* Minimizes intra-cluster distance, maximizes inter-cluster distance between points
* Each pair of points is progressively nested until one cluster remains
* Shows most divisive measures
* Doesn’t require advanced notion of number of segments

Euclidean Distance
* The shortest distance between two points

Ward Clustering Criterion
* At each stage distances between clusters are recomputed and dissimilarities are squared before cluster updating
