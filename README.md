# Exámenes de Talento
[![Code Climate](https://codeclimate.com/github/jaimerodas/examen-talento/badges/gpa.svg)](https://codeclimate.com/github/jaimerodas/examen-talento)
[![Test Coverage](https://codeclimate.com/github/jaimerodas/examen-talento/badges/coverage.svg)](https://codeclimate.com/github/jaimerodas/examen-talento/coverage)
[![CircleCI](https://circleci.com/gh/jaimerodas/examen-talento/tree/master.svg?style=svg)](https://circleci.com/gh/jaimerodas/examen-talento/tree/master)

En [@resuelve](https://github.com/resuelve), recibimos muchas personas que pasan por nuestro proceso de reclutamiento. Por ello, es muy importante que podamos filtrar a esas personas de la manera más eficiente. Una de las herramientas que usamos para eso es aplicar un examen de cultura y conocimientos generales. Hay variaciones de este examen para ciertos tipos de vacantes, pero la mayoría comparten preguntas entre sí.

Esta aplicación es una plataforma para presentar estos exámenes a través de internet, y se integra con la plataforma que usamos para administrar nuestras vacantes y candidatos: [Recruiterbox](https://recruiterbox.com). Sigue el proceso que podemos ver en [este documento](doc/Flujo%20Aplicaci%C3%B3n.md).

## En qué está hecho?
Esta cosa es una aplicación de Rails 5.1, corriendo en Ruby 2.4.1, ó lo que sea que traiga [.ruby-version](.ruby-version).

## Qué necesito?
Necesitas ruby 2.4.1 ó rbenv (o rvm si eres masoquista) y Postgres.

## Cómo lo instalo?
Después de hacer pull, yo correría lo siguiente:
```bash
$ rbenv install
$ gem install bundler -v 1.15.3
$ bundle install
$ rails db:setup
```

## Cómo lo corro?
Ya teniendo todo instalado, sólo haces:
```bash
$ rails s
```

y eso te deja un server corriendo en `localhost:3000`

## Cómo lo pruebo?
Puedes correr la suite de tests con:
```bash
$ rspec
```
