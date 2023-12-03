<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->get('/getData','MainController::getData');
$routes->get('/getMenu','MainController::getMenu');
$routes->get('/getCategory','MainController::getCategory');
$routes->get('/getCart/(:segment)', 'MainController::getCart/$1');
$routes->get('/getCartItem','MainController::getCartItem');
$routes->post('/register', 'MainController::register');
$routes->post('/login', 'MainController::login');
$routes->post('/book', 'MainController::book');
$routes->post('/addCart', 'MainController::addCart');
$routes->post('/addQuantity', 'MainController::addQuantity');
$routes->post('/decQuantity', 'MainController::decQuantity');
$routes->post('/addTestimonial', 'MainController::testimonial');
$routes->get('/getTestimonial','MainController::getTestimonial');
$routes->get('/getTable','MainController::getTable');
$routes->post('/checkout', 'CheckoutController::checkout');
$routes->match(['get', 'post'], '/getInvoice/(:num)', 'CheckoutController::invoice/$1');

