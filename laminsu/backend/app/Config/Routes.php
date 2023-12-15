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
$routes->match(['get', 'post'], '/checkout', 'CheckoutController::checkout');
$routes->match(['get', 'post'], '/getInvoice/(:num)', 'CheckoutController::invoice/$1');
$routes->match(['get', 'post'], '/fetchEmployee/(:num)', 'StaffController::fetchEmployee/$1');
$routes->put( '/updateStaff/(:num)', 'StaffController::update/$1');
$routes->get( '/getStaff', 'StaffController::getStaff');
$routes->delete( '/deleteStaff/(:num)', 'StaffController::deleteStaff/$1');
$routes->get( '/getReservations', 'ReservationController::getReservations');
$routes->post( '/cancelRes/(:num)', 'ReservationController::cancelRes/$1');
$routes->post( '/confirmRes/(:num)', 'ReservationController::confirmRes/$1');
$routes->get( '/getCancelled', 'ReservationController::getCancelled');
$routes->get( '/getConfirmed', 'ReservationController::getConfirmed');
$routes->post( '/payRes/(:num)', 'ReservationController::payRes/$1');
$routes->get( '/getPayed', 'ReservationController::getPayed');
$routes->match(['get', 'post'], '/fetchCustomer/(:num)', 'CustomerController::fetchCustomer/$1');
$routes->put( '/updateCustomer/(:num)', 'CustomerController::update/$1');
$routes->get( '/getCustomer', 'CustomerController::getCustomer');
$routes->delete( '/deleteCustomer/(:num)', 'CustomerController::deleteCustomer/$1');
$routes->get( '/getInv', 'InventoryController::getInv');
$routes->match(['get', 'post'], '/fetchProducts/(:num)', 'InventoryController::fetchProducts/$1');
$routes->put( '/updateProd/(:num)', 'InventoryController::updateProd/$1');
$routes->match(['get', 'post'], '/addProd', 'InventoryController::addProd');
$routes->get( '/getCat', 'InventoryController::getCat');
$routes->match(['get', 'post'], '/updateProd/(:num)', 'InventoryController::updateProd/$1');
$routes->match(['get', 'post'],'/pay', 'CheckoutController::payment');
$routes->delete( '/deleteProd/(:num)', 'InventoryController::deleteProd/$1');
$routes->delete( '/deleteCart/(:num)', 'CheckoutController::deleteCart/$1');
$routes->get( '/getAud', 'InventoryController::getAud');
$routes->put( '/updateQuan/(:num)', 'InventoryController::updateQ/$1');
