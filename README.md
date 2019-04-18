## Make the tasks as different modulars

* Task can be developed in parallel
* Task can be executed/accepted by PM through concourse execute command
* Chain the tasks with input -> task1 -> output -> task2 -> input ....

## About this example

* Demo Idea

It is like functional programming, which treats each task as an aggregation point.


Input|task1|output/input-of-task2|task2|output/input-of-task3|task3
--- | --- | --- | --- |--- |---
name/address parameters|Generate JSON|{"name" : "shaozhen", "password":"mypassword"}|Generate Json + Address|{"name" : "shaozhen", "password":"mypassword", "address": "This is my address"}|print out data

* Individual tasks can be run/validated locally with `execute`

  Validate Task1

  ```
  NAME=shaozhen PASSWORD=mypassword fly -t pvd execute -c tasks/task1/task.yml --input pipeline=. --output output-name-json=/tmp/test
  ```

  ```
  cat /tmp/test/name-password.json
  { "name": "shaozhen", "password": "mypassword" }
  ```

* Run the pipeline

 ```fly -t pvd sp -p collaboration-example -c pipelines.yml```
