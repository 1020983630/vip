package com.example.common;

import org.junit.Test;

public class AssertThrowUtil {
    public static String assertNotBlank(String message, String target) {
        if (target == null || target.trim().length() == 0) {
            throw new ThisSystemException(message);
        }
        return target;
    }

    public static String $(String message, String target) {
        return assertNotBlank(message, target);
    }

    public static void assertNotNull(String message, Object o) {
        if (o == null) {
            throw new ThisSystemException(message);
        }
    }

    public static void assertNull(String message, Object o) {
        if (o != null) {
            throw new ThisSystemException(message);
        }
    }

    public static void assertEquals(String message, Object o1, Object o2) {
        if (o1 == null ? o1 != o2 : !o1.equals(o2)) {
            throw new ThisSystemException(message);
        }
    }

    public static void assertNotEquals(String message, Object o1, Object o2) {
        if (o1 == null ? o1 == o2 : o1.equals(o2)) {
            throw new ThisSystemException(message);
        }
    }

    @Test
    public void test1() {
        Object o1 = new Object();
        Object o2 = o1;
        System.out.println(o1.equals(o2));

//        System.out.println(assertEquals("reuslt", o1, o2));
    }
}
