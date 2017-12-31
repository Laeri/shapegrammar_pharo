initialization
initialize
| bounds |
matchSelector := SGAgeSelector  new.
filter := SGMatchFilter new.
bounds := SGPolygon new.
bounds addPoint: (SGVector x:0.4 y: 0.4).
bounds addPoint: (SGVector x:0.6 y: 0.4).
bounds addPoint: (SGVector x:0.6 y: 0.6).
bounds addPoint: (SGVector x:0.4 y: 0.6 ).
filter bounds: bounds.
filter bounds: bounds.
labelTransforms := Dictionary new.
alphaToBetaLabels := Dictionary new.
alphaToBeta := Dictionary new.
optimization := SGRuleOptimization new.
optimization rule: self.