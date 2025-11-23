# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Compare and contrast One Hot and Binary encodings

One hot gives every state its own flip and only one flip flop is high at a time which makes the next logic very simple while Binary encodes the uses to a minimum number of flip flops for the state count. If you have an N state then you only need log2(N) flip flops. The downsdide is that the next state logic is more complex because many states share the same flip flop. 

### Which method did your team find easier, and why?

One hot method is easier because of the logic being much cleaner. With each state having its own flip flop, you can see exactly where you are in the machine without decoding or doing anything different. The binary just took more time to do. 

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.

You would use One hot when you have plenty of flip flops and want simple fast logic. FPGAs have a lot of registers so using one per state is no problem. Binary is better when you need to save flip flops because the design is bigger or has a lot of states. One Hot is for speed and easy logic. Binary is for saving space.