module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
      extend: {
          animation: {
              "text-shadow-pop-br": "text-shadow-pop-br 0.6s ease   both",
              "tracking-in-expand": "tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000)   both"
          },
          keyframes: {
              "text-shadow-pop-br": {
                  "0%": {
                      "text-shadow": "0 0 #555, 0 0 #555, 0 0 #555, 0 0 #555, 0 0 #555, 0 0 #555, 0 0 #555, 0 0 #555",
                      transform: "translateX(0) translateY(0)"
                  },
                  to: {
                      "text-shadow": "1px 1px #555, 2px 2px #555, 3px 3px #555, 4px 4px #555, 5px 5px #555, 6px 6px #555, 7px 7px #555, 8px 8px #555",
                      transform: "translateX(-8px) translateY(-8px)"
                  }
              },
              "tracking-in-expand": {
                  "0%": {
                      "letter-spacing": "-.5em",
                      opacity: "0"
                  },
                  "40%": {
                      opacity: ".6"
                  },
                  to: {
                      opacity: "1"
                  }
              },
          }
      }
  },
  plugins: [require("daisyui")],  
}
