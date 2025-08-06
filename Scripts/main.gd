extends Control
@onready var cash_label: Label = %CashLabel

func _process(_delta: float) -> void:
	cash_label.text = "CASH: " + str(GameMenegerSingleton.money)
