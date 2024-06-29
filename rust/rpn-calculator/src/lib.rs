#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    let mut stack: Vec<i32> = Vec::new();

    for input in inputs {
        match *input {
            CalculatorInput::Add => {
                let y = stack.pop()?;
                let x = stack.pop()?;
                stack.push(x + y)
            }
            CalculatorInput::Subtract => {
                let y = stack.pop()?;
                let x = stack.pop()?;
                stack.push(x - y)
            }
            CalculatorInput::Multiply => {
                let y = stack.pop()?;
                let x = stack.pop()?;
                stack.push(x * y)
            }
            CalculatorInput::Divide => {
                let y = stack.pop()?;
                let x = stack.pop()?;
                stack.push(x / y)
            }
            CalculatorInput::Value(value) => stack.push(value),
        }
    }

    if stack.len() == 1 {
        return Some(stack[0]);
    }

    return None;
}
