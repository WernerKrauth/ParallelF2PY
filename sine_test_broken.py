#!/usr/bin/python
# see README file
import sine_module

################################################
#This code works exactly as hoped
import numpy
tmp = numpy.zeros(10)
for index in range(10):
    sine_module.sine_add_2(index,tmp)
print "The correct answer is"
print tmp
################################################


#This is an attempt to use fortran functions within a parallel python
#script. To share data between processes we must use a
#multiprocessing.RawArray
import multiprocessing as MP

#The entry function for each process
def worker(task_queue, shared_data):
    for task in iter(task_queue.get, 'DIE'):
        #The problem appears to be that shared_data is a MP.RawArray
        #We need to pass the underlying c-pointer and not to copy!
        sine_module.sine_add_2(shared_data,task)

#Create the queue for communication and start-up the processes
task_queue = MP.Queue()
shared_data = MP.RawArray('d', [0.]*10);
process1 = MP.Process(target=worker, args=(task_queue, shared_data))
process2 = MP.Process(target=worker, args=(task_queue, shared_data))
process1.start()
process2.start()

#Queue up tasks
for k in range(10): 
   task_queue.put(k)              

#Shutdown processes
task_queue.put('DIE')
task_queue.put('DIE')
process1.join() 
process2.join()

#Output (incorrect) data
print shared_data[:]
