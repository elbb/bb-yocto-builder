
# embedded linux building block template

this code serves as a template for the creation of further building blocks with the purpose of giving all blocks a uniform structure and usage.

## using dobi for local build

dobi should only be used via the `dobi.sh` script, because there important variables are set and the right scripts are included.

By default three dobi resouces are defined (but not implemented):

```sh
./dobi.sh build  # build the buildingblock
./dobi.sh test   # run all tests
./dobi.sh deploy # deploy the buildingblock
```

these point to the resources defined in dobi.yaml
the separation between meta.yaml and dobi.yaml is necessary to integrate the building block into another building block via dobi.

version informations are generated automatically from git history by using gitversion (<https://github.com/elbb/bb-gitversion>).

# What is embedded linux building blocks

embedded linux building block's is a project to create reusable and
adoptable blueprints for highly recurrent issues in building an internet
connected embedded linux system.
