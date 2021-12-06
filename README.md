# **Заказ справок ЛЭТИ**

На данный момент для запуска необходим файл, который будет хранить переменную PSEUDO_API с токеном доступа

## ___1.___ ___ETUDocumentOrderingMenu___
    
Первый экран приложения, содержит в себе *@StateObject* **ETUDocumentOrderingMenuViewModel**, кнопка "История заказов" ведет на заглушку, а "Заказать справку" на следующий экран. Классы для кнопок хранятся в директориии Components.

### __Скрины__

<img src="./images/photo_2021-12-06_14-26-04.jpg" width="230"/>

***

## ___2.___ ___ETUDocumentOrdering___

Второй экран, соотвественно содержит в себе собственную ViewModel - **ETUDocumentOrderingViewModel**. Классы дропдаунов хранятся в директории Components. Соответственно, если не выбраны все требуемые поля, то кнопка заказть - заблокирована.

### __Скрины__

<img src="./images/photo_2021-12-06_14-26-09.jpg" width="230"/> 
<img src="./images/photo_2021-12-06_14-26-12.jpg" width="230"/> 
<img src="./images/photo_2021-12-06_14-26-16.jpg" width="230"/>
<img src="./images/photo_2021-12-06_14-26-19.jpg" width="230"/>

***

## ___3.___ ___ETUOrderDocumentOfStuding___

Третий экран, также хранит собственную ViewModel - **ETUDocumentOfStudingViewModel**. Заказ справок об обучении. Все компоненты на экране хранятся в директории Components. Есть подозрение, что чекбокс "Нужна гербовая печать" может некорректно работать на телефоне, но в симуляторе работает.

### __Скрины__

<img src="./images/photo_2021-12-06_14-26-22.jpg" width="230"/> 
<img src="./images/photo_2021-12-06_14-26-24.jpg" width="230"/> 
<img src="./images/photo_2021-12-06_14-26-26.jpg" width="230"/> 


***

## ___4.___ ___ETUOrderDocumentOfIncomes___

Четвертый экран, ViewModel - **ETUDocumentOfIncomesViewModel**. Заказ справки о доходах. Для календаря был создан новый компонент.

### __Скрины__

<img src="./images/photo_2021-12-06_14-26-30.jpg" width="230"/> 
<img src="./images/photo_2021-12-06_14-26-28.jpg" width="230"/> 

***

## ___5.___ ___ETUOrderNDFL2___
Пятый экран, ViewModel - **ETUDocument2NDFLViewModel**. Заказ справки 2-НДФЛ.

### __Скрины__

<img src="./images/photo_2021-12-06_14-26-32.jpg" width="230"/> 


