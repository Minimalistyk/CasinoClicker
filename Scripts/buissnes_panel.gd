extends Control
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var label: Label = %Ilosc
@onready var buy_button: Button = %BuyButton
@onready var cash_button: Button = %CashButton

var ile := 1
var money_needed := 50
func _process(delta: float) -> void:
	if progress_bar.value >= 100:
		GameMenegerSingleton.money += 100 * ile
		progress_bar.value = 0
	label.text = str(ile)
	buy_button.text = "BUY 1 FOR " + str(money_needed)
	cash_button.text = str(100 * ile) + "$"
func _on_button_pressed() -> void:
	progress_bar.value += 10


func _on_buy_button_pressed() -> void:
	if GameMenegerSingleton.money < money_needed:
		return
	GameMenegerSingleton.money -= money_needed
	money_needed *= 2.25
	ile += 1
