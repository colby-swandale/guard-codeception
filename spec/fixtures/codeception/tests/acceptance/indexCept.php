<?php
$scenario->group('group1');
$I = new WebGuy($scenario);
$I->amOnPage('/');
$I->see('Foo Bar', 'h2');
