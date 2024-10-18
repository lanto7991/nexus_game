extends Node

var gameStarted: bool

var playerBody: CharacterBody2D
var playerWeaponEquip: bool

var playerAlive: bool
var playerDamageZone: bool
var playerDamageAmount: int

var enemyDamageZone: Area2D
var enemyDamageAmount: int

var contador = 0
