<?php

use App\Kernel;

require_once dirname(__DIR__).'/vendor/autoload_runtime.php';

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};

if(getenv("JAWSDB_URL") !== false) {

    $dbparts = parse_url(getenv("JAWSDB_URL"));

    $hostname = $dbparts['eyvqcfxf5reja3nv.cbetxkdyhwsb.us-east-1.rds.amazonaws.com'];
    $username = $dbparts['k2surkzj8plin37y'];
    $password = $dbparts['eoalq9tl8zjtbv4y'];
    $database = ltrim($dbparts['mjatkzreyhx4ommh'],'/');
} else {
    // on est en local
    $hostname = 'localhost';
    $username = 'root';
    $password = 'root';
    $database = 'societe-espion';

}