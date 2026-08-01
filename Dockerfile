# 1. Start from an official Node.js image (Alpine = small Linux distro, ~5MB base)
FROM node:20-alpine

# 2. Set the working directory inside the container — all following commands run here
WORKDIR /app

# 3. Copy ONLY package files first (not the whole app yet)
COPY package*.json ./

# 4. Install dependencies exactly as locked in package-lock.json, skip devDependencies
RUN npm ci --omit=dev

# 5. Now copy the rest of your application code
COPY . .

# 6. Document which port the app listens on (informational — doesn't actually open it)
EXPOSE 3000

# 7. The command that runs when the container starts
CMD ["node", "app.js"]