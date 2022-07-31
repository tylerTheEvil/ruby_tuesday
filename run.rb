# frozen_string_literal: true

require_relative 'ds'
require_relative 'computer'

ds = DS.new
workstation1 = Computer.new(1, ds)
p workstation1.mouse
p workstation1.cpu
p workstation1.keyboard
