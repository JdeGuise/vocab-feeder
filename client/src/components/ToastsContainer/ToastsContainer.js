import Toast from '../Toast/Toast';

const ToastsContainer = ({ toasts, position = "bottom-center" }) => {
  return (
    <div className={`toasts-container ${position}`}>
      {toasts.map((toast) => (
        <Toast key={toast.id} {...toast} />
      ))}
    </div>
  );
};

export default ToastsContainer;