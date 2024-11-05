extends Node

var marker_position = Vector2(6700, 660)

var gameStarted: bool

var playerBody: CharacterBody2D
var playerWeaponEquip: bool

var playerAlive: bool
var playerDamageZone: bool
var playerDamageAmount: int

var enemyDamageZone: Area2D
var enemyDamageAmount: int

var contador = 0

var contador_doblesalto = 0

var timer_progress_bar = 0

var capibara_kill = 0
