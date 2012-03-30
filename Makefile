
sine_module.so: sine_operation.f
	f2py2.7 -c -m sine_module sine_operation.f -DF2PY_REPORT_ON_ARRAY_COPY=1

all: sine_module.so