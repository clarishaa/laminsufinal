<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->get('/getData','MainController::getData');
$routes->get('/getMenu','MainController::getMenu');
$routes->get('/getCategory','MainController::getCategory');
$routes->get('/getCart','MainController::getCart');
$routes->get('/getCartItem','MainController::getCartItem');
$routes->post('/register', 'MainController::register');
$routes->post('/login', 'MainController::login');
$routes->post('/book', 'MainController::book');
$routes->post('/addCart', 'MainController::addCart');
