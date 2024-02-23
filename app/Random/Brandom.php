<?php

namespace App\Random;

class BRandom
{
    private $RNG_INT = array();

    public function __construct()
    {
        $this->RandomInit(time());
    }

    public function IRandom($min, $max)
    {
        if ($max <= $min) {
            if ($max == $min) {
                return $min;
            } else {
                return -2147483648; // 0x80000000;
            }
        }

        return mt_rand($min, $max);
    }

    private function BRandom_t()
    {
        $sum = (2111111111 * $this->RNG_INT[3]) +
               (1492 * $this->RNG_INT[2]) +
               (1776 * $this->RNG_INT[1]) +
               (5115 * $this->RNG_INT[0]) +
               $this->RNG_INT[4];
        
        $this->RNG_INT[3] = $this->RNG_INT[2];
        $this->RNG_INT[2] = $this->RNG_INT[1];
        $this->RNG_INT[1] = $this->RNG_INT[0];
        $this->RNG_INT[4] = $sum >> 32;
        $this->RNG_INT[0] = $sum;

        return $this->RNG_INT[0];
    }

    private function RandomInit($seed)
    {
        if ($seed <= 0) {
            $seed = time();
        }

        $s = $seed;
        for ($i = 0; $i < 5; $i++) {
            $s = $s * 29943829 - 1;
            $this->RNG_INT[$i] = $s;
        }

        for ($i = 0; $i < 19; $i++) {
            $this->BRandom_t();
        }
    }
}
