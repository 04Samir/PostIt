# PostIt
Welcome to my Forum Web-Application! This was Built for a Module at University.


## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Live Preview](#live)


## Installation
Clone the Repository:
```bash
$ git clone https://github.com/04Samir/PostIt.git
```

Navigate to the Directory:
```bash
$ cd PostIt
```

Install the Dependencies:
```bash
$ npm install
```

Set-Up the Database:
```bash
$ mysql -u root -p < source src/database/commands/create_db.sql
```

Insert the Dummy Data:
```bash
$ mysql -u root -p < source src/database/commands/insert_data.sql
```


## Usage
Start the Server:
```bash
$ npm start
```

Now you Can Visit [`localhost:3000`](http://localhost:3000) To View The Application!


## Live
You Can View a Live Preview of the Application [Here](https://projects.samir.cx/PostIt)
