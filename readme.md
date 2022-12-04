# Le CoinCoin
le CoinCoin est un website backend qui aide a administrer les
annonces et les utilisateurs , les modifier, les supprimer et les créer !


## Fonctionnalités

- Une couche de sécurité qui empêchev l’accès à la partie backend sans
  identifiants.
- 2 types de comptes utilisateurs (ADMIN,CLIENT)
- les opérations de CRUD sont disponible sur les utilisateurs,les annonces,Les illustrations.


## Built With
● Grails -
The framework used

● Spring Security - The authentication
and access-control framework used

● Html,CSS - The frontend framework used

● Bootstrap - The frontend framework still used for
the admin editor
## Prerequisites
This project is written in Java.

● Java 8
## API REST

Nous disposant d'un controller du nom de ApiController.groovy au sein de notre projet, il s'agit du moteur de notre API REST.
L'annotation @Secured designe les personnes ayant un des roles mentionees ce qui lui permettra d'utiliser l'API.
```
  @Secured('ROLE_ADMIN')
class ApiController {

    /**
     * Singleton
     * Gestion des points d'entrée : GET / PUT / PATCH / DELETE
     */
    def annonce() {
        // On vérifie qu'un ID ait bien été fourni
        if (!params.id)
            return response.status = 400
        // On vérifie que l'id corresponde bien à une instance existante
        def annonceInstance = Annonce.get(params.id)
        if (!annonceInstance)
            return response.status = 404

```
## SECURITE
● API REST : chaque rôle à ses propres droits et interdictions (par exemple un USER ne peut pas supprimer un autre utilisateur),
 sa gestion est au niveau de notre ApiController comme suit :
```
class UserController {

    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }
```

## Screenshots

AUTHENTIFICATION:
![Capture](https://user-images.githubusercontent.com/86912253/205485125-e848cea8-555b-48db-bd60-21b63f23086a.PNG)
LES ANNONCES: 
![Capture1](https://user-images.githubusercontent.com/86912253/205485157-64e43f14-0a18-4d1b-b52e-60f203fc2b2a.PNG)
USERS:
![Capture2](https://user-images.githubusercontent.com/86912253/205485179-6ef785fa-8f0f-46a7-860e-eab7c32231e4.PNG)

## Used By

Ce projet est utilisé par l'entreprise Lecoincoin

## Authors

- [@Ilyass El Hariri](https://github.com/ilyaselhariri)

- [@Hamza Janate](https://github.com/HamzaJanate)
