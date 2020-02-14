# Kong-Docker-LocalDb-setup

This is just a simple Docker Ubuntu Image with Kong setup to run w/ their local database.

Build the Image <br/>
`docker build -t kong .`

Run the Image <br/>
`docker run -it kong bash`

One you log in, just run <br/>
`kong start` <br/>

Then you can test with <br/>
`curl -i http://localhost:8001/`
