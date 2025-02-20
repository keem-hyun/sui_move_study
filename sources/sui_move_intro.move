use std::string;
use sui::object::{Self, UID};
use sui::transfer;
use sui::tx_context::{Self, TxContext};

module sui_move_intro::hello_world {
  public fun addition (a: u8, b: u8) : u8 {
    a + b
  }

   public fun mint(ctx: &mut TxContext) {
    let object = HelloWorldObject {
        id: object::new(ctx),
        text: string::utf8(b"Hello, World!")
    };
    transfer::public_transfer(object, tx_context::sender(ctx));
   } 
}

public struct HelloWorldObject has key, store {
    id: UID,
    text: string::String,
}