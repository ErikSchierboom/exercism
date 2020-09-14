import math

const InnerCircle = 1.0f
const MiddleCircle = 5.0f
const OuterCircle = 10.0f

const InnerCircleScore = 10
const MiddleCircleScore = 5
const OuterCircleScore = 1
const OutsideBoardScore = 0

proc distanceFromCenter(dart: (float, float)): float =
  hypot(dart[0], dart[1])

proc landedIn(dart: (float, float), circleWidth: float): bool =
  dart.distanceFromCenter <= circleWidth

proc score*(dart: (float, float)): int =
  if dart.landedIn(InnerCircle): InnerCircleScore
  elif dart.landedIn(MiddleCircle): MiddleCircleScore
  elif dart.landedIn(OuterCircle): OuterCircleScore
  else: OutsideBoardScore
