/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
        fontFamily : {
            'silk': ['Silkscreen']
        },
        colors: {
          'purple1':['#280A46'],
          'purple2':['#B7A2D9']

        }
    },
  },
  plugins: [],
}
