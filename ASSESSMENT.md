# Code Assessment

## Overview
We would like you to take the existing application and extend it with the ability to track the statuses of items over time. Currently there is an item model. The item has a weight, an id, and a container number which represents the container the item is currently stored in.

We need to make sure that we can expose the following information via an api: 

* `/containers/:id` which returns the container and the total weight(sum of all item weights) of the container
* `/containers/:id/items` which returns every item in a container

