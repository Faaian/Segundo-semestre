package com.mycompany.prueba;

import java.time.LocalDateTime;

public class MiException extends Exception {
    static LocalDateTime time = LocalDateTime.now();
    public MiException(String message){
        super(time.toString() + ": "+ message);
    }
}
