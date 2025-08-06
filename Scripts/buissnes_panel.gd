extends Control
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var label: Label = %Ilosc
@onready var buy_button: Button = %BuyButton
@onready var cash_button: Button = %CashButton

@onready var auto_click: Button = %AutoClick
@onready var auto_click_label: Label = %AutoClickLabel
var auto_click_count := 1
var auto_click_upgade_cost := 100

@onready var click_boost: Button = %ClickBoost
@onready var click_boost_label: Label = %ClickBoostLabel
var click_boost_count := 1.0
var click_boost_upgade_cost := 100

@onready var cash_boost: Button = %CashBoost
@onready var cash_boost_label: Label = %CashBoostLabel
var cash_boost_count := 1
var cash_boost_upgade_cost := 100

var buissnes := 1
var buy_cost := 50
#var upgade_cost := 100
func _ready() -> void:
	auto_click_label.text = str(auto_click_upgade_cost)
	click_boost_label.text = str(click_boost_upgade_cost)
	cash_boost_label.text = str(cash_boost_upgade_cost)
func _process(_delta: float) -> void:
	if progress_bar.value >= 100:
		GameMenegerSingleton.money += 100 * buissnes
		progress_bar.value = 0
	label.text = str(buissnes)
	buy_button.text = "BUY 1 FOR " + str(buy_cost)
	cash_button.text = str(100 * buissnes) + "$"
func _on_button_pressed() -> void:
	progress_bar.value += 10 * click_boost_count

func _on_buy_button_pressed() -> void:
	if GameMenegerSingleton.money < buy_cost:
		return
	GameMenegerSingleton.money -= buy_cost
	buy_cost *= 2.25
	buissnes += 1


func _on_click_boost_pressed() -> void:
	if GameMenegerSingleton.money < click_boost_upgade_cost:
		return
	click_boost_count += 0.5
	GameMenegerSingleton.money -= click_boost_upgade_cost
	click_boost_upgade_cost *= 4
	click_boost_label.text = str(click_boost_upgade_cost)
	
