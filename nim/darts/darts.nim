import math

const InnerCircle = 1.0f
const MiddleCircle = 5.0f
const OuterCircle = 10.0f

const InnerCircleScore = 10
const MiddleCircleScore = 5
const OuterCircleScore = 1
const OutsideBoardScore = 0

proc radius(dart: (float, float)): float =
  (dart[0].pow(2) + dart[1].pow(2)).sqrt

proc landedIn(dart: (float, float), radius: float): bool =
  dart.radius <= radius

proc score*(dart: (float, float)): int =
  if dart.landedIn(InnerCircle): InnerCircleScore
  elif dart.landedIn(MiddleCircle): MiddleCircleScore
  elif dart.landedIn(OuterCircle): OuterCircleScore
  else: OutsideBoardScore
