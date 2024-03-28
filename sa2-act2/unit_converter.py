#!/usr/bin/env python3
import argparse

def convert_length(value, from_unit, to_unit):
    conversion_table = {
        ('m', 'cm'): lambda x: x * 100,
        ('cm', 'm'): lambda x: x / 100,
        ('cm', 'in'): lambda x: x / 2.54,
        ('in', 'cm'): lambda x: x * 2.54,
        ('in', 'ft'): lambda x: x / 12,
        ('ft', 'in'): lambda x: x * 12,
        ('m', 'ft'): lambda x: x * 3.281,
        ('ft', 'm'): lambda x: x / 3.281,
    }
    try:
        return conversion_table[(from_unit, to_unit)](value)
    except KeyError:
        raise ValueError("Error: unsupported conversion")

def convert_weight(value, from_unit, to_unit):
    conversion_table = {
        ('kg', 'g'): lambda x: x * 1000,
        ('g', 'kg'): lambda x: x / 1000,
        ('kg', 'lb'): lambda x: x * 2.205,
        ('lb', 'kg'): lambda x: x / 2.205,
        ('lb', 'oz'): lambda x: x * 16,
        ('oz', 'lb'): lambda x: x / 16,
        ('g', 'oz'): lambda x: x / 28.35,
        ('oz', 'g'): lambda x: x * 28.35,
    }
    try:
        return conversion_table[(from_unit, to_unit)](value)
    except KeyError:
        raise ValueError("Error: unsupported conversion")

def convert_temperature(value, from_unit, to_unit):
    if from_unit == 'F' and to_unit == 'C':
        return (value - 32) * 5 / 9
    elif from_unit == 'C' and to_unit == 'F':
        return (value * 9 / 5) + 32
    else:
        raise ValueError("Error: unsupported conversion")

def main():
    parser = argparse.ArgumentParser(description="CLI tool to convert units between different measurement systems")
    parser.add_argument("value", type=float, help="Value to be converted")
    parser.add_argument("--from_unit", type=str, choices=['m', 'cm', 'in', 'ft', 'kg', 'g', 'lb', 'oz', 'F', 'C'],
                        help="Unit of the input value")
    parser.add_argument("--to_unit", type=str, choices=['m', 'cm', 'in', 'ft', 'kg', 'g', 'lb', 'oz', 'F', 'C'],
                        help="Unit to convert to")
    args = parser.parse_args()

    try:
        if args.from_unit in ['m', 'cm', 'in', 'ft'] and args.to_unit in ['m', 'cm', 'in', 'ft']:
            result = convert_length(args.value, args.from_unit, args.to_unit)
        elif args.from_unit in ['kg', 'g', 'lb', 'oz'] and args.to_unit in ['kg', 'g', 'lb', 'oz']:
            result = convert_weight(args.value, args.from_unit, args.to_unit)
        elif args.from_unit in ['F', 'C'] and args.to_unit in ['F', 'C']:
            result = convert_temperature(args.value, args.from_unit, args.to_unit)
        else:
            raise ValueError("Error: unsupported conversion")
        print(f"{args.value} {args.from_unit} is equal to {result:.2f} {args.to_unit}")
    except ValueError as e:
        print(e)

if __name__ == "__main__":
    main()
