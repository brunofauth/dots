#! /usr/bin/env python3

import subprocess as sp
import sys
import os


COLORS = {
    "amber": [
        "s/ac = .*/ac = #ffb300/g",
        "s/bi = .*/bi = #ffb300/g",
        "s/be = .*/be = #ffb300/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "blue": [
        "s/ac = .*/ac = #1e88e5/g",
        "s/bi = .*/bi = #1e88e5/g",
        "s/be = .*/be = #1e88e5/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "blue-gray": [
        "s/ac = .*/ac = #546e7a/g",
        "s/bi = .*/bi = #546e7a/g",
        "s/be = .*/be = #546e7a/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "brown": [
        "s/ac = .*/ac = #6d4c41/g",
        "s/bi = .*/bi = #6d4c41/g",
        "s/be = .*/be = #6d4c41/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "cyan": [
        "s/ac = .*/ac = #00acc1/g",
        "s/bi = .*/bi = #00acc1/g",
        "s/be = .*/be = #00acc1/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "deep-orange": [
        "s/ac = .*/ac = #f4511e/g",
        "s/bi = .*/bi = #f4511e/g",
        "s/be = .*/be = #f4511e/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "deep-purple": [
        "s/ac = .*/ac = #5e35b1/g",
        "s/bi = .*/bi = #5e35b1/g",
        "s/be = .*/be = #5e35b1/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "green": [
        "s/ac = .*/ac = #43a047/g",
        "s/bi = .*/bi = #43a047/g",
        "s/be = .*/be = #43a047/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "grey": [
        "s/ac = .*/ac = #757575/g",
        "s/bi = .*/bi = #757575/g",
        "s/be = .*/be = #757575/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "indigo": [
        "s/ac = .*/ac = #3949ab/g",
        "s/bi = .*/bi = #3949ab/g",
        "s/be = .*/be = #3949ab/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "light-blue": [
        "s/ac = .*/ac = #039be5/g",
        "s/bi = .*/bi = #039be5/g",
        "s/be = .*/be = #039be5/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "light-green": [
        "s/ac = .*/ac = #7cb342/g",
        "s/bi = .*/bi = #7cb342/g",
        "s/be = .*/be = #7cb342/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "lime": [
        "s/ac = .*/ac = #c0ca33/g",
        "s/bi = .*/bi = #c0ca33/g",
        "s/be = .*/be = #c0ca33/g",
        "s/mf = .*/mf = #252525/g"],
    "orange": [
        "s/ac = .*/ac = #fb8c00/g",
        "s/bi = .*/bi = #fb8c00/g",
        "s/be = .*/be = #fb8c00/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "pink": [
        "s/ac = .*/ac = #d81b60/g",
        "s/bi = .*/bi = #d81b60/g",
        "s/be = .*/be = #d81b60/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "purple": [
        "s/ac = .*/ac = #8e24aa/g",
        "s/bi = .*/bi = #8e24aa/g",
        "s/be = .*/be = #8e24aa/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "red": [
        "s/ac = .*/ac = #e53935/g",
        "s/bi = .*/bi = #e53935/g",
        "s/be = .*/be = #e53935/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "teal": [
        "s/ac = .*/ac = #00897b/g",
        "s/bi = .*/bi = #00897b/g",
        "s/be = .*/be = #00897b/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "yellow": [
        "s/ac = .*/ac = #fdd835/g",
        "s/bi = .*/bi = #fdd835/g",
        "s/be = .*/be = #fdd835/g",
        "s/mf = .*/mf = #252525/g"],
    "amber-dark": [
        "s/ac = .*/ac = #ffb300/g",
        "s/bi = .*/bi = #ffb300/g",
        "s/be = .*/be = #ffb300/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "blue-dark": [
        "s/ac = .*/ac = #1e88e5/g",
        "s/bi = .*/bi = #1e88e5/g",
        "s/be = .*/be = #1e88e5/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "blue-gray-dark": [
        "s/ac = .*/ac = #546e7a/g",
        "s/bi = .*/bi = #546e7a/g",
        "s/be = .*/be = #546e7a/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "brown-dark": [
        "s/ac = .*/ac = #6d4c41/g",
        "s/bi = .*/bi = #6d4c41/g",
        "s/be = .*/be = #6d4c41/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "cyan-dark": [
        "s/ac = .*/ac = #00acc1/g",
        "s/bi = .*/bi = #00acc1/g",
        "s/be = .*/be = #00acc1/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "deep-orange-dark": [
        "s/ac = .*/ac = #f4511e/g",
        "s/bi = .*/bi = #f4511e/g",
        "s/be = .*/be = #f4511e/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "deep-purple-dark": [
        "s/ac = .*/ac = #5e35b1/g",
        "s/bi = .*/bi = #5e35b1/g",
        "s/be = .*/be = #5e35b1/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "green-dark": [
        "s/ac = .*/ac = #43a047/g",
        "s/bi = .*/bi = #43a047/g",
        "s/be = .*/be = #43a047/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "gray-dark": [
        "s/ac = .*/ac = #757575/g",
        "s/bi = .*/bi = #757575/g",
        "s/be = .*/be = #757575/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "indigo-dark": [
        "s/ac = .*/ac = #3949ab/g",
        "s/bi = .*/bi = #3949ab/g",
        "s/be = .*/be = #3949ab/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "light-blue-dark": [
        "s/ac = .*/ac = #039be5/g",
        "s/bi = .*/bi = #039be5/g",
        "s/be = .*/be = #039be5/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "light-green-dark": [
        "s/ac = .*/ac = #7cb342/g",
        "s/bi = .*/bi = #7cb342/g",
        "s/be = .*/be = #7cb342/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "lime-dark": [
        "s/ac = .*/ac = #c0ca33/g",
        "s/bi = .*/bi = #c0ca33/g",
        "s/be = .*/be = #c0ca33/g",
        "s/mf = .*/mf = #252525/g"],
    "orange-dark": [
        "s/ac = .*/ac = #fb8c00/g",
        "s/bi = .*/bi = #fb8c00/g",
        "s/be = .*/be = #fb8c00/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "pink-dark": [
        "s/ac = .*/ac = #d81b60/g",
        "s/bi = .*/bi = #d81b60/g",
        "s/be = .*/be = #d81b60/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "purple-dark": [
        "s/ac = .*/ac = #8e24aa/g",
        "s/bi = .*/bi = #8e24aa/g",
        "s/be = .*/be = #8e24aa/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "magenta-dark": [
        "s/ac = .*/ac = #fb0f8b/g",
        "s/bi = .*/bi = #fb0f8b/g",
        "s/be = .*/be = #fb0f8b/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "red-dark": [
        "s/ac = .*/ac = #e53935/g",
        "s/bi = .*/bi = #e53935/g",
        "s/be = .*/be = #e53935/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "teal-dark": [
        "s/ac = .*/ac = #00897b/g",
        "s/bi = .*/bi = #00897b/g",
        "s/be = .*/be = #00897b/g",
        "s/mf = .*/mf = #f5f5f5/g"],
    "yellow-dark": [
        "s/ac = .*/ac = #fdd835/g",
        "s/bi = .*/bi = #fdd835/g",
        "s/be = .*/be = #fdd835/g",
        "s/mf = .*/mf = #252525/g"]}

COLOR_NAMES = bytes("|".join(f" {color}" for color in COLORS), "utf-8")
ROFI_CMD = ["rofi", "-sep", "|", "-dmenu", "-i", ",-p", "Pick Color"]


if len(sys.argv) < 2:
    result = sp.run(ROFI_CMD, input=COLOR_NAMES, capture_output=True).stdout
    color = str(result, "utf-8").strip()[2:]

    # In case the user 'ESC's rofi
    if not color:
        raise SystemExit

elif sys.argv[1] in COLORS:
    color = sys.argv[1]
else:
    raise ValueError(f"Available colors: {list(COLORS.keys())}")


PDIR = "$HOME/.config/polybar"

for sed_expr in COLORS[color]:
    os.system(f"sed -i -e '{sed_expr}' {PDIR}/colors.ini")


if color.endswith('-dark'):
    os.system(f'sed -i -e "s/bg = .*/bg = #9A252525/g" {PDIR}/colors.ini')
    os.system(f'sed -i -e "s/fg = .*/fg = #FFf5f5f5/g" {PDIR}/colors.ini')
else:
    os.system(f'sed -i -e "s/bg = .*/bg = #9Af5f5f5/g" {PDIR}/colors.ini')
    os.system(f'sed -i -e "s/fg = .*/fg = #FF252525/g" {PDIR}/colors.ini')


# Restarting polybar
os.system("polybar-msg cmd restart")
