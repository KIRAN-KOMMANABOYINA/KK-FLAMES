package com.kk.flames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@Controller
public class FlamesController {

    private final List<FlamesEntry> flamesHistory = new ArrayList<>();

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/calculate")
    @ResponseBody
    public FlamesEntry calculateFlames(@RequestParam String name1, @RequestParam String name2) {

        String n1 = name1.trim().toLowerCase();
        String n2 = name2.trim().toLowerCase();

        Optional<FlamesEntry> existing = flamesHistory.stream()
                .filter(e -> e.getName1().equals(n1) && e.getName2().equals(n2))
                .findFirst();

        if (existing.isPresent()) return existing.get();

        String result = calculateResult(n1, n2);
        FlamesEntry entry = new FlamesEntry(n1, n2, result);
        flamesHistory.add(entry);
        return entry;
    }

    private String calculateResult(String name1, String name2) {
        String combined = (name1 + name2).replaceAll("\\s+", "").toLowerCase();
        int uniqueCount = combined.chars().distinct().toArray().length;
        String[] results = {"Friends", "Love", "Affection", "Marriage", "Enemies", "Siblings"};
        return results[uniqueCount % results.length];
    }

    public static class FlamesEntry {
        private String name1;
        private String name2;
        private String result;

        public FlamesEntry(String name1, String name2, String result) {
            this.name1 = name1;
            this.name2 = name2;
            this.result = result;
        }

        public String getName1() { return name1; }
        public String getName2() { return name2; }
        public String getResult() { return result; }
    }
}
