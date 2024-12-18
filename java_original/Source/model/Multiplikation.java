/*
Copyright (c) 2017, Norman Sutatyo
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. 
*/

package remasp.model;

public class Multiplikation extends Befehl implements Instruktion {

    public Multiplikation(Operand operand, String einLabel, int startOffset, int endOffset) {
        super(operand, einLabel, startOffset, endOffset);
    }

    @Override
    public void eval(Konfiguration konfig) {
        long ergebnis = Math.multiplyExact(konfig.getRegister(0), operand.getZahlenWert(konfig));
        konfig.setRegister(0, ergebnis);
        konfig.incBz();
    }

}
