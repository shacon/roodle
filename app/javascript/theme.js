import { createTheme } from "@mui/material/styles";

const theme = createTheme({
  typography: {
    fontFamily: '"Oxanium", sans-serif',
    // This applies Oxanium to all typography variants
    h1: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 600,
    },
    h2: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 600,
    },
    h3: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 500,
    },
    h4: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 500,
    },
    h5: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 500,
    },
    h6: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 500,
    },
    body1: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 400,
    },
    body2: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 300,
    },
    button: {
      fontFamily: '"Oxanium", sans-serif',
      fontWeight: 500,
    },
  },
  palette: {
    primary: {
      light: "#62b5e5",
      main: "#3a87b4", // Your existing blue
      dark: "#2a5d7e",
      contrastText: "#fff",
    },
    secondary: {
      light: "#ff7961",
      main: "#fc4553", // From your failed test gradient
      dark: "#ba000d",
      contrastText: "#fff",
    },
    warning: {
      light: "#fff350",
      main: "#b4a83a", // Your exception yellow
      dark: "#c79400",
      contrastText: "#000",
    },
    success: {
      light: "#e7ffd9",
      main: "#caffbf", // Your passed test green
      dark: "#75c46b",
      contrastText: "#000",
    },
    background: {
      default: "#f8f9fa",
      paper: "#ffffff",
    },
  },
  components: {
    MuiButton: {
      styleOverrides: {
        // For gradient buttons
        containedPrimary: {
          background:
            "linear-gradient(90deg, rgba(58, 135, 180, 0.8) 0%, rgba(98, 181, 229, 1) 100%)",
          "&:hover": {
            background:
              "linear-gradient(90deg, rgba(58, 135, 180, 1) 0%, rgba(98, 181, 229, 0.9) 100%)",
          },
        },
        containedSecondary: {
          background:
            "linear-gradient(90deg, rgba(252, 69, 83, 0.8) 0%, rgba(255, 173, 173, 1) 100%)",
          "&:hover": {
            background:
              "linear-gradient(90deg, rgba(252, 69, 83, 1) 0%, rgba(255, 173, 173, 0.9) 100%)",
          },
        },
      },
    },
    MuiCard: {
      styleOverrides: {
        root: {
          borderRadius: 10,
          padding: 10,
        },
      },
    },
  },
});

export default theme;
