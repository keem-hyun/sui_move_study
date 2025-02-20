module sui_move_intro::hello_world {
  use std::string;
  use sui::object::{Self, UID};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  public fun addition (a: u8, b: u8) : u8 {
    a + b
  }

  public struct HelloWorldObject has key, store {
    id: UID,
    text: string::String,
  }

  public fun mint(ctx: &mut TxContext) {
    let object = HelloWorldObject {
        id: object::new(ctx),
        text: string::utf8(b"Hello, World!")
    };
    transfer::public_transfer(object, tx_context::sender(ctx));
  } 
}

