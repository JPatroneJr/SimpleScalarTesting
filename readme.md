# installing and testing with simple scalar
Comp Sys Foundations I (COMP-503-002, INFS-515-002)

Clone this repository to your local machine and ensure that docker is installed.


Run, build, and enter the container with simplescalar installed
Remove '--platform linux/amd64' if not running on apple silicon

```
docker build --platform linux/amd64 -t simplescalar . 
docker run -d --name simplescalar_container simplescalar tail -f /dev/null 
docker exec -it simplescalar_container /bin/bash 
```
### Somethimes the dockerfile fails to compose, if that happens then run this, since the container was built it failed to enter.
Enter the container and run the commands int he docker file line by line
```
docker exec -it simplescalar_container /bin/bash
```



### Execute a series of four tests on the llong test suite.
```
#llong
/simplescalar/simplesim-3.0/sim-outorder -cache:dl1 dl1:4096:32:1:l tests/bin.little/test-math > 4096_32_llong.txt 2>&1 
/simplescalar/simplesim-3.0/sim-outorder -cache:dl1 dl1:4096:64:1:l tests/bin.little/test-math > 4096_64_llong.txt 2>&1 
/simplescalar/simplesim-3.0/sim-outorder -cache:dl1 dl1:32768:32:1:l tests/bin.little/test-llong > 32768_32_llong.txt 2>&1 
/simplescalar/simplesim-3.0/sim-outorder -cache:dl1 dl1:32768:64:1:l tests/bin.little/test-llong > 32768_64_llong.txt 2>&1 
```

### Leave the container
```
Exit
```

### Copy the file produced by simplescalar into your local machine
```
docker cp simplescalar_container:/simplescalar/simplesim-3.0/4096_32_llong.txt .
docker cp simplescalar_container:/simplescalar/simplesim-3.0/4096_64_llong.txt .
docker cp simplescalar_container:/simplescalar/simplesim-3.0/32768_32_llong.txt .
docker cp simplescalar_container:/simplescalar/simplesim-3.0/32768_64_llong.txt .
```

These files can then be cleaned and interpreted. An example is provided in llong.ipyn

# Python
### install, init, and launch jupyter to visualize data
```
python3 -m venv venv
source venv/bin/activate
pip install pandas jupyter
jupyter-notebook
```

