use rand::Rng;
use std::cmp::Ordering;
use std::io;

const MAX_GUESS: u32 = 100;

fn generate_secret(max: u32) -> u32 {
	// Generate a secret number
	// We use the rand crate, thus we need to add the following line to Cargo.toml
	// --- Cargo.toml
	// ...
	// [dependencies]
	// rand = "0.8.3"
	//
	// Then run cargo build to update the dependencies
	// And import the new crate (see at the top): use rand::Rng;
	let mut rng = rand::thread_rng();
	return rng.gen_range(1..=max);
}

fn main() {
    println!("Guess the number!");

		let secret_number = generate_secret(MAX_GUESS);
		let mut trials = 0;

		// Infinite loop until the player finds the number
    loop {
			println!("Please input your guess.");

			// Rust variables are immutable by default (value won't change)
			// Note that references and pointers are also immutable!!
			// To make a variable mutable, we add mut before the variable name
			let mut guess = String::new();

			// Read the user input
			// read_line returns a Result value (enum) which can either be equal to Ok or Err
			// - If Err is returned, expect will throw an error
			// - If Ok is returned, the value will be stored in the guess variable
			io::stdin()
					.read_line(&mut guess) // Since references are immutable by default, we need to add mut here
					.expect("Failed to read line");

			// Check that the input is a number (it shadows the other guess variable)
			// - trim() removes all the whitespaces
			// - parse() converts a string to another type, here u32 for an unsigned 32-bit integer
			let guess: u32 = match guess.trim().parse() {
				Ok(num) => {
					trials += 1;
					num
				},
				Err(_) => {
					println!("Please input an integer number!");
					continue
				},
			};
			
			// Use placeholders
			// Or also: println!("You guessed: {}", guess);
			println!("You guessed: {guess}");		

			// Compare values
			match guess.cmp(&secret_number) {
				Ordering::Less => println!("Too small!"),
				Ordering::Greater => println!("Too big"),
				Ordering::Equal => {
					println!("You won in {trials} trials!");
					break;
				},
			}
		}

}
