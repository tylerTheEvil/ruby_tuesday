# ruby_tuesday

## A Duplication Problem
Refactor duplicated code.

Today, your boss asked you to work on a program for the accounting department. They want a system that flags expenses greater than $99 for computer gear, so they can crack down on developers splurging with company money. (You read that right: $99. The purchasing department isn’t fooling around.)
Some other developers already took a stab at the project, coding a report that lists all the components of each computer in the company and how much each component costs. To date, they haven’t plugged in any real data. Here’s where you come in.

## The Legacy System

Right from the start, you have a challenge on your hands: the data you need to load into the already established program is stored in a legacy system stuck behind an awkwardly coded class named DS (for “data source”).

`DS#initialize` connects to the data system when you create a new DS object. The other methods—and there are dozens of them—take a workstation identifier and return descriptions and prices for the computer’s components.

```ruby
ds = DS.new
ds.get_cpu_info(42) # => "2.9 Ghz quad-core"
ds.get_cpu_price(42) # => 120
ds.get_mouse_info(42) # => "Wireless Touch"
ds.get_mouse_price(42) # => 60
```

It looks like workstation number 42 has a 2.9GHz CPU and a luxurious $60 mouse. This is enough data to get you started.

You have to wrap DS into an object that fits the reporting application. This means each Computer must be an object. This object has a single method for each component, returning a string that describes both the component and its price. Remember that price limit set by the purchasing department? Keeping this requirement in mind, you know that if the component costs $100 or more, the string must begin with an asterisk to draw people’s attention.
You kick off development by writing the first three methods in the Computer class: 
https://github.com/mani47/ruby_tuesday/blob/master/computer.rb

At this point in the development of Computer, you find yourself bogged down in a swampland of repetitive copy and paste. You have a long list of methods
left to deal with, and you should also write tests for each and every method, because it’s easy to make mistakes in duplicated code.

There are two different ways to remove this duplication:

* First is called Dynamic Methods. 
* The other is a special method called method_missing.

Refactor the `computer.rb` twice to use both of the above methods. Argue which one is better.
