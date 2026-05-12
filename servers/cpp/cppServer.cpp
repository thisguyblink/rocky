#include "httplib.h"
#include <iostream>

std::string processInput(std::string input) {
    std::string reversed;
    for (int i = input.size() - 1; i > 0; i--) { 
        reversed += input[i];
    }
    return reversed;
}

int main() {
    httplib::Server svr;

    svr.Get("/status", [](const httplib::Request&, httplib::Response& res) {
        res.set_content("C++ Server is alive \n", "text/plain");
    });

    svr.Post("/process", [](const httplib::Request&request, httplib::Response& res) {
        std::string input = request.body;
        std::string output = "The input has been reversed: ";
        output = output + processInput(input);
        res.set_content(output, "text/plain");
    });

    std::cout << "C++ Server starting" << std::endl;
  svr.listen("127.0.0.1", 9001);
}