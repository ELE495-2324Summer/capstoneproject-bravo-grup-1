[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/5mCoF9-h)
# TOBB ETÜ ELE495 - Capstone Project

# Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Acknowledgements](#acknowledgements)

## Introduction
- Bu projede Jetson Nano ile çalışan bir JetBot kullanarak otonom park eden bir araç geliştirmek amaçlamaktadır. JetBot’un kendisine tahsis edilen park yerini bulması ve platform üzerindeki kırmızı çizgilerin üzerinden geçmeden park etmesi sağlanacaktır. Sistemin hedefi, JetBot’un otonom olarak tahsis edilen park yerini bulabilmesi, belirtilen sınırlar içinde park edebilmesi ve her ihlalde telefondaki uygulamaya bir puan cezası (-1 puan) bildirerek park işlemi sonunda toplam ceza puanlarının takip edilebilmesini sağlamaktır.
- Proje gereksinimleri ışığında her gruba bir plaka numarası ile beyaz karton platform üzerinde bir park yeri atanacaktır. Rastgele bir konumdan başlayan JetBot, kendisine tahsis edilen park yerini bulmalı ve üç dakika içinde kırmızı çizgilere dokunmadan park etmelidir. Başarılı park işleminin ardından, tamamlanma mesajı telefona iletilecektir. Eğer atanmış park yeri platformda yoksa, sistem telefona park yeri olmadığı bilgisini iletecektir. Demo sırasında, atanmış plaka numarası değiştirilerek park işlemi tekrarlanacaktır. Ayrıca, JetBot iki kez kırmızı çizgiyi ihlal ederek hareket ettirilip telefonda toplam ceza puanlarının görüntülenmesi sağlanacaktır.


## Features
List the key features and functionalities of the project.
- Hardware: The hardware components used (should be listed with links)
- Operating System and packages
- Applications 
- Services 

## Installation
Describe the steps required to install and set up the project. Include any prerequisites, dependencies, and commands needed to get the project running.

```bash
# Example commands
git clone https://github.com/username/project-name.git
cd project-name
```

## Usage
Provide instructions and examples on how to use the project. Include code snippets or screenshots where applicable.

## Screenshots
Include screenshots of the project in action to give a visual representation of its functionality. You can also add videos of running project to YouTube and give a reference to it here. 

## Acknowledgements
Give credit to those who have contributed to the project or provided inspiration. Include links to any resources or tools used in the project.

[Contributor 1](https://github.com/user1)
[Resource or Tool](https://www.nvidia.com)
