# Automatización de Pruebas con Cucumber, Capybara y Ruby

Este proyecto implementa un framework de automatización de pruebas utilizando Cucumber, Capybara y Ruby. Está diseñado para ejecutar pruebas automatizadas de manera eficiente y mantenible.

> [!TIP] 
> Requisitos Previos 
> Antes de ejecutar el proyecto, asegúrese de tener instalados los siguientes componentes:
>
> 1. **Software Base:**
>
>    - Ruby
>    - Selenium WebDriver
>    - Navegador web compatible (Chrome, Firefox o Edge) con su respectivo driver
>
> 2. **Instalar las Gemas de Ruby:**
>    - `gem install cucumber`
>    - `gem install capybara`
>    - `gem install selenium-webdriver`
>    - `gem install selenium`
>    - `gem install rspec`
>    - `gem install capybara-screenshot`

> [!IMPORTANT]
> Existen dos formas de ejecutar las pruebas::
>
> - cucumber
>
> Para ejecutar un archivo específico de pruebas:
>
> - cucumber features \ [nombreDelArchivo].feature
>
> Para generar Reporte HTML con más detalles y formato mejorado
>
> - cucumber --format pretty --format html --out reports/report.html