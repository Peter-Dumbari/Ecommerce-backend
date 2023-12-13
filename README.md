# E-commerce Backend

<a id="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
  - [🎬 Representation](#representation)
  - [🧮 Kanban Board](#kanban-board)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 E-commerce (Backend) <a id="about-project"></a>

**E-commerce** is a website own by a company which is into computer sales and repair, and Accesories sales, this website is manage by the admin which is incharge uploading the available products and required function while the users can orger and view available product, this actually the backend repository, the frontend will be build somewhere else.

## 🛠 Built With <a id="built-with"></a>

### Tech Stack <a id="tech-stack"></a>

<details>
  <summary>Ruby on Rails</summary>
  <ul>
    <li><a>https://rubyonrails.org/</a></li>   
  </ul>
</details>

<!-- Features -->

### Key Features <a id="key-features"></a>

- **Ability to see the Available products for sale**
- **The ability to add Product to cart**
- **The ability to order product**
- **The ability to upload products available for sale**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a id="live-demo"></a>

Live demo for the website [Coming Soon]().

<p align="right">(<a href="#readme-top">back to top</a>)</p>

All 5 authors have been contributing to this project from start to finish.

<!-- GETTING STARTED -->

## 💻 Getting Started <a id="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project, you need to:

- Install Ruby
- Install Rails
- Install Posgresql
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Setup

Clone this repository to your desired folder:

```
  git clone https://github.com/Peter-Dumbari/Ecommerce-backend.git
```

### Install

Install this project with these commands:

```
  cd hotel-hub-backend
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Database Setup.

Before creating database, you have to configure the master key for your project. This can be done in two ways.

1. **Using our own master key that we have provided**
   cd into the project folder and in your terminal run

```
rails rake:secret

```

<!-- - This command will generate a master.key file and inside that file replace the key with the one shown below.

**[f387ccf0b4eebd334dc8725a1cb9573]**

- Proceed to creating db.

2. **Generating your own master Key**

- Remove config/master.key and config/credentials.yml.enc if they exist.
- Run in the terminal: EDITOR=code rails credentials:edit
- Close the editor that opens.
- This command will create a new master.key and credentials.yml.enc if they do not exist.

- After this proceed to creating db with: -->

```
  rails db:create
  rails db:migrate
  rails db:seed
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Usage

To run the project execute the following command:

```
 rails s
```

or

```
./bin/dev
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Tests <a id="run-tests"></a>

To run the tests for models and requests, execute the following command:

```
rspec ./spec/models
rspec ./spec/requests/api/v1

```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a id="authors"></a>

👤 **Peter Dumbari**

- GitHub: [@githubhandle](https://github.com/Peter-Dumbari)
- Twitter: [@twitterhandle](https://twitter.com/PeterDumbari)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/peterdumbari/

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a id="future-features"></a>

- **[Payment Integration into the System]**
- **[Add email confirmation]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a id="contributing"></a>

Contributions, issues, as well as feature requests are welcome!

<!-- Feel free to check the [issues page](https://github.com/ProgramKingAbel/hotel-hub-frontend/issues). -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a id="support"></a>

If you like this project, kindly leave a comment below and share it with
someone who enjoys coding! or still, give us a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a id="acknowledgements"></a>

- Thanks to our Microverse team members and coding partners for their invaluable contributions and dedication.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a id="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
