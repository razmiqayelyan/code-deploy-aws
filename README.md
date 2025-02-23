# **code-deploy-aws - Simple AWS CodeDeploy Test**  

This project demonstrates how to deploy a simple HTML page using **AWS CodeDeploy** on an **EC2 instance**. It includes an `index.html` file and an `appspec.yml` configuration for automatic deployment.  

## **🚀 Features**
- Deploys a **basic HTML page** via **AWS CodeDeploy**.
- Uses **`appspec.yml`** for deployment automation.
- Supports deployment from **GitHub** or **Amazon S3**.
- Works on an EC2 instance running **Ubuntu/Linux**.

---

## **📂 Project Structure**
```
/code-deploy-aws/
│── index.html          # Simple HTML page for testing
│── appspec.yml         # AWS CodeDeploy configuration
│── README.md           # Documentation (this file)
```

---

## **🛠 Prerequisites**
Before deploying, ensure you have:
1. **An AWS Account** with CodeDeploy access.
2. **An EC2 instance** with:
   - **IAM Role** that allows CodeDeploy access.
   - A running **Apache or Nginx** web server (optional).
3. **AWS CLI installed** on your local machine.
4. **GitHub repository** (if deploying from GitHub).
5. **An S3 Bucket** (if deploying from S3).

---

## **🔧 Setup & Deployment**

### **1️⃣ Clone the Repository (If Using GitHub)**
```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/code-deploy-aws.git
cd code-deploy-aws
```

---

### **2️⃣ Upload the App to GitHub**
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/code-deploy-aws.git
git push -u origin main
```

---

### **3️⃣ Upload the App to S3 (If Using S3 for Deployment)**
```bash
zip -r code-deploy-aws.zip .
aws s3 cp code-deploy-aws.zip s3://your-bucket-name/
```

---

### **4️⃣ Set Up AWS CodeDeploy**
1. Go to **AWS Console** → **CodeDeploy**.
2. Click **Create Application** → Name it **code-deploy-aws**.
3. Choose **Compute Platform: EC2/On-Premises**.
4. Click **Create Deployment Group**.
   - Select your EC2 instance.
   - Set Deployment Type to **In-Place**.
   - Choose an IAM Role with **AWSCodeDeployFullAccess**.
5. **Deploy from GitHub or S3**:
   - If using GitHub, connect your repository.
   - If using S3, enter the path:  
     `s3://your-bucket-name/code-deploy-aws.zip`.

---

### **5️⃣ Test Your Deployment**
After the deployment is complete:
- Open your **EC2 Public IP** in a browser:
  ```
  http://your-ec2-ip/index.html
  ```
- You should see the **"Welcome to CodeDeploy AWS"** page. 🚀

---

## **🔍 Troubleshooting**
If the deployment fails, check:
1. **CodeDeploy logs:**
   ```bash
   cat /var/log/aws/codedeploy-agent/codedeploy-agent.log
   ```
2. **App logs (if using Apache/Nginx):**
   ```bash
   sudo tail -f /var/log/apache2/error.log
   ```

---

## **📝 Notes**
- This setup uses `appspec.yml` to **automatically copy files** to `/var/www/html/` (Apache/Nginx web directory).
- No extra deployment scripts (`start.sh`) are needed.
- You can extend this project with **CSS, JavaScript, or backend code**.
