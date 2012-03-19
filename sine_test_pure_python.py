#!/usr/bin/python
# see README file
import multiprocessing as MP
import sine_module,math
def sine_add_python(task):
    """it is this function which I want to write in 
    Fortran or C, keeping the access to the RawArray, 
    rather than to a copy of it"""
    for k in range(2,100001): 
        shared_data[task] += math.sin(1./k)
def worker(task_queue, shared_data):
    for task in iter(task_queue.get, 'DIE'):
        sine_add_python(task)
task_queue = MP.Queue()
shared_data = MP.RawArray('d', [0.]*10);
process1 = MP.Process(target=worker, args=(task_queue, shared_data))
process2 = MP.Process(target=worker, args=(task_queue, shared_data))
process1.start()
process2.start()
for k in range(10): 
   task_queue.put(k)              
task_queue.put('DIE')
task_queue.put('DIE') 
process1.join() 
process2.join()
print shared_data[:]
